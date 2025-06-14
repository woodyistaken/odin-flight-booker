import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets=["list","container","template"]
  static values={count:Number}
  addPassenger(){
    console.log(this.countValue)
    let clone=this.clonePassenger()
    this.rewriteClone(clone)
    this.addCloneToContainer(clone)
  }
  clonePassenger(){
    return this.templateTarget.content.cloneNode(true)
  }
  rewriteClone(clone){
    let labels = clone.querySelectorAll("label");
    labels[0].htmlFor=`booking_passengers_attributes_${this.countValue}_name`
    labels[1].htmlFor=`booking_passengers_attributes_${this.countValue}_email`
    let inputs = clone.querySelectorAll("input");
    inputs[0].id=`booking_passengers_attributes_${this.countValue}_name`
    inputs[0].name=`booking[passengers_attributes][${this.countValue}][name]`
    inputs[1].id=`booking_passengers_attributes_${this.countValue}_email`
    inputs[1].name=`booking[passengers_attributes][${this.countValue}][email]`
    return clone
  }
  addCloneToContainer(clone){
    this.countValue+=1
    this.containerTarget.append(clone)
  }
  deletePassenger(){
    if(this.countValue<=1){
      return
    }
    let labels=Array.from(this.listTarget.querySelectorAll("label"))
    labels.pop().remove()
    labels.pop().remove()
    let inputs=Array.from(this.listTarget.querySelectorAll("input"))
    inputs.pop().remove()
    inputs.pop().remove()
    let breaks=Array.from(this.listTarget.querySelectorAll("br"))
    breaks.pop().remove()
    this.countValue--

  }
  connect(){
    console.log("pain")
  }
}
