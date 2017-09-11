
{ buildLispPackage, stdenv, fetchurl, lisp-project_snmp, 
   lisp_snmp,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_snmp  ];
      inherit stdenv;
      systemName = "snmp-ui";
      
      sourceProject = "${lisp-project_snmp}";
      patches = [];
      lisp_dependencies = "${lisp_snmp}";
      name = "lisp_snmp-ui-6.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
