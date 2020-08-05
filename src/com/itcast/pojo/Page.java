package com.itcast.pojo;

import java.util.List;

public class Page<T> {

    public static final Integer PAGE_SIZE = 3;

    //总页码
    private Integer pageTotal;
    //当前页码
    private Integer pageNo;
    //总记录数
    private Integer pageTotalCount;
    //当前页显示数量
    private Integer pageSize = PAGE_SIZE;
    //分页条的请求地址
    private String url;
    //当前页数据
    private List<T> items;

    public Page() {
    }

    public Page(Integer pageTotal, Integer pageNo, Integer pageTotalCount, Integer pageSize, List<T> items) {
        this.pageTotal = pageTotal;
        this.pageNo = pageNo;
        this.pageTotalCount = pageTotalCount;
        this.pageSize = pageSize;
        this.items = items;
    }

    public static Integer getPageSize() {
        return PAGE_SIZE;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public Integer getPageTotal() {
        return pageTotal;
    }

    public void setPageTotal(Integer pageTotal) {
        this.pageTotal = pageTotal;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        //数据边界的有效检查
        if (pageNo<1){
            pageNo=1;
        }else if (pageNo>pageTotal){
            pageNo=pageTotal;
        }
        this.pageNo = pageNo;
    }

    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageTotal=" + pageTotal +
                ", pageNo=" + pageNo +
                ", pageTotalCount=" + pageTotalCount +
                ", pageSize=" + pageSize +
                ", url='" + url + '\'' +
                ", items=" + items +
                '}';
    }
}
