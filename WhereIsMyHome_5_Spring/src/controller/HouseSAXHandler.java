package controller;

import java.util.ArrayList;
import java.util.List;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import dto.HouseDeal;

public class HouseSAXHandler extends DefaultHandler{
	private List<HouseDeal> houseDealList = new ArrayList<>();
	
	private String temp;
	private HouseDeal houseDeal;
	
	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		if(qName.equals("item")) {
			houseDeal = new HouseDeal();
		}
	}
	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		if(qName.equals("법정동")) {
			houseDeal.setDong(temp.trim());
		} else if(qName.equals("법정동시군구코드")) {
			houseDeal.setBjdsgg(temp.trim());
		} else if(qName.equals("법정동읍면동코드")) {
			houseDeal.setBjdumd(temp.trim());
		} else if(qName.equals("아파트")) {
			houseDeal.setAptName(temp.trim());
		} else if(qName.equals("거래금액")) {
			houseDeal.setDealAmount(temp.trim());
		} else if(qName.equals("전용면적")) {
			houseDeal.setArea(temp.trim());
		} else if(qName.equals("층")) {
			houseDeal.setFloor(Integer.parseInt(temp.trim()));
		} else if(qName.equals("item")) {
			houseDealList.add(houseDeal);
		}
	}
	
	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
		temp = new String(ch, start, length);
	}
	public List<HouseDeal> getHouseDealList() {
		return houseDealList;
	}
	
}
