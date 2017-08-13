#!/bin/bash
controller_class() {

echo "SERVICE CONTROLLER CLASS " $1 $2 $3

P=$1
C=$2
PN=$3
lcn=${C,} 

if [ ! -z "$4" ]; then
W=$4
else
W=$(pwd)
fi
FD="/src/main/java/"
ext=".java"
id="_id"


base=$PN$FD
ctrl="controller"
# foldercn=$W/$base${P//.//}/$ctrl
foldercn=$base${P//.//}/$ctrl
mkdir -p -- "$foldercn"

cni="_Controller"
cncls=$foldercn/$C$cni$ext
show="show"
form="form"
ser="_Service"

cat > "$cncls" << EOF1
package $P.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import $P.bases.MapsTypeset;
import $P.models.$C;
import $P.service_implements.$C$sii;

@Controller
public class $C$cni {

	private $C$sii $lcn$ser;
	
	@Autowired
	public void set$C$ser($C$sii $lcn$ser) {
		this.$lcn$ser = $lcn$ser;
	}
	
	@RequestMapping(value = "/$lcn$lar", method = RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("$lcn$lar", $lcn$ser.listAll$C$lar());
		System.out.println("Returning $C$lar:");
		return "$lcn/$lcn$lar";
	}

	@RequestMapping("$lcn/{$lcn$id}")
	public String show$C(@PathVariable Long $lcn$id, Model model) {
		model.addAttribute("$lcn", $lcn$ser.get$C$byid($lcn$id));
		return "$lcn/$lcn$show";
	}

	@RequestMapping("$lcn/delete/{$lcn$id}")
	public String delete$C(@PathVariable Long $lcn$id) {
		$lcn$ser.delete$C($lcn$id);
		return "redirect:/$lcn$lar";
	}

	@RequestMapping("$lcn/edit/{$lcn$id}")
	public String edit(@PathVariable Long $lcn$id, Model model) {
		model.addAttribute("$lcn", $lcn$ser.get$C$byid($lcn$id));
		return "$lcn/$lcn$form";
	}

	@RequestMapping("$lcn/new")
	public String new$C(Map<String, Object> map) {
		map.put("$lcn", new $C());
		return "$lcn/$lcn$form";
	}
	
	
	@RequestMapping(value = "$lcn", method = RequestMethod.POST)
	public String save$C($C $lcn) {
		System.out.println("$C ID :" + $lcn.get$C$id() + ":");
		$lcn$ser.save$C($lcn);
		return "redirect:/$lcn$lar";
	}
}
EOF1


}
