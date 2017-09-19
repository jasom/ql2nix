
{ buildLispPackage, stdenv, fetchurl, lisp-project_snmp, 
   lisp_portable-threads, lisp_ieee-floats, lisp_trivial-gray-streams, lisp_usocket, lisp_ironclad,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_portable-threads lisp_ieee-floats lisp_trivial-gray-streams lisp_usocket lisp_ironclad  ];
      inherit stdenv;
      systemName = "snmp";
      
      sourceProject = "${lisp-project_snmp}";
      patches = [];
      lisp_dependencies = "${lisp_portable-threads} ${lisp_ieee-floats} ${lisp_trivial-gray-streams} ${lisp_usocket} ${lisp_ironclad}";
      name = "lisp_snmp-6.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
