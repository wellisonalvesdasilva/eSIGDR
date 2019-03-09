package com.dtoREL;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import java.util.List;

import com.entities.Usuario;

public class UsuarioREL {

	public void imprimir(List<Usuario> usuarios) throws Exception {

		JasperReport report = JasperCompileManager.compileReport("c:/rpt_users.jrxml");
		JasperPrint print = JasperFillManager.fillReport(report, null, new JRBeanCollectionDataSource(usuarios));
		JasperExportManager.exportReportToPdfFile(print, "c:/relatorio_usuario.pdf");

	}

}