# import pandas as pd
# data = pd.read_csv('./word/mpg.txt', encoding='utf-8')
# displ4 = data['displ'] <= 4
# print(displ4)
# displ4 = data[displ4]
# print(displ4)
#
# displ5 = data['displ'] >= 5
# print(displ5)
# displ5 = data[displ5]
# print(displ5)

class Mpg(object):
    def __init__(self,manufacturer,model,displ,year,cyl,trans,drv,cty,hwy,fl,cls):
        self.manufacturer = manufacturer
        self.model = model
        self.displ = displ
        self.year  = year
        self.cyl   = cyl
        self.trans = trans
        self.drv   = drv
        self.cty   = cty
        self.hwy   = hwy
        self.fl    = fl
        self.cls   = cls

    def getManufacturer(self):
        return self.manufacturer
    def getModel(self):
        return self.model
    def getDispl(self):
        return self.displ
    def getYear(self):
        return self.year
    def getCyl(self):
        return self.cyl
    def getTrans(self):
        return self.trans
    def getDrv(self):
        return self.drv
    def getCty(self):
        return self.cty
    def getHwy(self):
        return self.hwy
    def getFl(self):
        return self.fl
    def getCls(self):
        return self.cls
