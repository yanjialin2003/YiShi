export default class HttpOptions {
  /**
   * Nginx服务器的主机地址(域名).
   */
  static readonly SERVER: string = 'http://192.168.10.56:9588';

  /**
   * 超时时间.
   */
  static readonly HTTP_READ_TIMEOUT: number = 10000;

  /**
   * 请求成功状态信息.
   */
  static readonly SERVER_CODE_SUCCESS: string = 'success';

  /**
   * 请求成功状态码.
   */
  static readonly HTTP_CODE_200: number = 200;

  /**
   * 分页大小.
   */
  static readonly PAGE_SIZE: number = 10;
}

/**
 * 请求内容类型.
 */
export const enum ContentType {
  JSON = 'application/json',
  FORM = 'multipart/form-data'
}