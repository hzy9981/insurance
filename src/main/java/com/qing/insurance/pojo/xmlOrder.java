package com.qing.insurance.pojo;

public class xmlOrder {
        private String createTime;//创建时间
        private String orderNo;//订单序号
        private String orderOwner;//订单用户
        private String carOwner;//车主
        private Double bz;//交强险
        private String carTaxType;//车辆缴税类型
        private Double a;//车损险
        private Double b;//三责险
        private Double d11;//司机责任险
        private Double d12;//乘客责任险
        private Double g;// 全车盗抢险
        private String f;//玻璃破碎险
        private Double l;//车身划痕险
        private Double x1;//发动机损失险
        private Double z;//自燃损失险
        private Double j1;//专修厂特约
        private Double a1;//第三方特约险
        private Double syiAmount;//A+B+D11+D12+G+L+X1+Z+J1+A1
        private Double amount;
        public String getOrderNo() {
            return orderNo;
        }
        public void setOrderNo(String orderNo) {
            this.orderNo = orderNo;
        }
    public String getCreateTime() {
        return createTime;
    }
    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
    public String getCarOwner() {
        return carOwner;
    }
    public void setCarOwner(String carOwner) {
        this.carOwner = carOwner;
    }
        public String getOrderOwner() {
            return orderOwner;
        }
        public void setOrderOwner(String orderOwner) {
            this.orderOwner = orderOwner;
        }
        public Double getBz() {
            return bz;
        }
        public void setBz(Double bz) {
            this.bz = bz;
        }
        public String getCarTaxType() {
            return carTaxType;
        }
        public void setCarTaxType(String carTaxType) {
            this.carTaxType = carTaxType;
        }
        public Double getA() {
            return a;
        }
        public void setA(Double a) {
            this.a = a;
        }
        public Double getB() {
            return b;
        }
        public void setB(Double b) {
            this.b = b;
        }
        public Double getD11() {
            return d11;
        }
        public void setD11(Double d11) {
            this.d11 = d11;
        }
        public Double getD12() {
            return d12;
        }
        public void setD12(Double d12) {
            this.d12 = d12;
        }
        public Double getG() {
            return g;
        }
        public void setG(Double g) {
            this.g = g;
        }
        public String getF() {
            return f;
        }
        public void setF(String f) {
            this.f = f;
        }
        public Double getL() {
            return l;
        }
        public void setL(Double l) {
            this.l = l;
        }
        public Double getX1() {
            return x1;
        }
        public void setX1(Double x1) {
            this.x1 = x1;
        }
        public Double getZ() {
            return z;
        }
        public void setZ(Double z) {
            this.z = z;
        }
        public Double getJ1() {
            return j1;
        }
        public void setJ1(Double j1) {
            this.j1 = j1;
        }
        public Double getA1() {
            return a1;
        }
        public void setA1(Double a1) {
            this.a1 = a1;
        }

        public Double getSyiAmount() {
            return syiAmount;
        }
        public void setSyiAmount(Double syiAmount) {
            this.syiAmount = syiAmount;
        }
        public Double getAmount() {
            return amount;
        }
        public void setAmount(Double amount) {
            this.amount = amount;
        }



        public xmlOrder(String orderNo, String orderOwner, Double bz, String carTaxType, Double a, Double b, Double d11,
                     Double d12, Double g, String f, Double l, Double x1, Double z, Double j1, Double a1, Double syiAmount,
                     Double amount) {
            super();
            this.orderNo = orderNo;
            this.orderOwner = orderOwner;
            this.bz = bz;
            this.carTaxType = carTaxType;
            this.a = a;
            this.b = b;
            this.d11 = d11;
            this.d12 = d12;
            this.g = g;
            this.f = f;
            this.l = l;
            this.x1 = x1;
            this.z = z;
            this.j1 = j1;
            this.a1 = a1;
            this.syiAmount = syiAmount;
            this.amount = amount;
        }
        public xmlOrder() {
            super();
            // TODO Auto-generated constructor stub
        }
        @Override
        public String toString() {
            return "Order [orderNo=" + orderNo + ", orderOwner=" + orderOwner + ", bz=" + bz + ", carTaxType=" + carTaxType
                    + ", a=" + a + ", b=" + b + ", d11=" + d11 + ", d12=" + d12 + ", g=" + g + ", f=" + f + ", l=" + l + ", x1="
                    + x1 + ", z=" + z + ", j1=" + j1 + ", a1=" + a1 + ", syiAmount=" + syiAmount + ", amount=" + amount + "]";
        }
}
