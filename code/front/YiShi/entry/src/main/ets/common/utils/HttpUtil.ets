import { http } from '@kit.NetworkKit';
import ResponseResult from '../../api/model/ResponseResult';
import HttpOptions, { ContentType } from '../constants/HttpOptions';

/**
 * 向指定 URL 发起 HTTP GET 请求.
 *
 * @param url 用于发起 HTTP 请求的 URL.
 */
export function Get(url: string) {
  return httpRequest(url, http.RequestMethod.GET, '');
}

/**
 * 向指定 URL 发起 HTTP POST 请求.
 *
 * @param url 用于发起 HTTP 请求的 URL.
 * @param params 请求的其他数据.
 * @returns
 */
export function Post<T>(url: string, params: T) {
  return httpRequest(url, http.RequestMethod.POST, params);
}

/**
 * 向给定 URL 发起 HTTP 请求.
 *
 * @param url 用于发起 HTTP 请求的 URL.
 * @param method 请求方法.
 * @param params 请求的其他数据.
 * @returns Promise
 */
function httpRequest<T>(url: string, method: http.RequestMethod, params?: T): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: HttpOptions.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': ContentType.JSON
    },
    connectTimeout: HttpOptions.HTTP_READ_TIMEOUT,
    extraData: params
  });
  let serverData = new ResponseResult();

  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === HttpOptions.HTTP_CODE_200) {
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.code === HttpOptions.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = `${$r('app.string.http_error_message')}&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.msg = $r('app.string.http_error_message');
    return serverData;
  });
}