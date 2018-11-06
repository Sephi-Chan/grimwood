local layers = {}
local Layers = {}

function Layers:Layers(pX,pY,pImg,pScaleX,pScaleY)
  self.x =pX
  self.y = pY
  self.img = pImg
  self.scaleX = pScaleX
  self.scaleY = pScaleY
  self.w = pImg:getWidth() * pScaleX
  self.h = pImg:getHeight() * pScaleY
  
end

function Layers.draw(pLayers)
  local self = pLayers
  love.graphics.draw(self.img,self.x-self.w,self.y,0,self.scaleX,self.scaleY)
  love.graphics.draw(self.img,self.x,self.y,0,self.scaleX,self.scaleY)
  love.graphics.draw(self.img,self.x+self.w,self.y,0,self.scaleX,self.scaleY)
end

function Layers:Update(delta,pCamera)
  if pCamera.x < self.x - self.w then
    self.x = pCamera.x
  end
  if pCamera.x > self.x + self.w then
    self.x = pCamera.x
  end
  
end



function layers.new(pX,pY,pImg,pScaleX,pScaleY)
   local self = {}
    for k, v in pairs(Layers) do
      self[k] = v
    end
    self:Layers(pX,pY,pImg,pScaleX,pScaleY)
   return self
end


return layers 