
{ buildLispPackage, stdenv, fetchurl, lisp-project_snmp, 
   lisp_snmp, lisp_snmp-server,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_snmp lisp_snmp-server  ];
      inherit stdenv;
      systemName = "snmp-test";
      
      sourceProject = "${lisp-project_snmp}";
      patches = [];
      lisp_dependencies = "${lisp_snmp} ${lisp_snmp-server}";
      name = "lisp_snmp-test-6.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
