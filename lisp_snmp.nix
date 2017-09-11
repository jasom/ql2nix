
{ buildLispPackage, stdenv, fetchurl, lisp-project_snmp, 
   lisp_ieee-floats, lisp_ironclad, lisp_portable-threads, lisp_trivial-gray-streams, lisp_usocket,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ieee-floats lisp_ironclad lisp_portable-threads lisp_trivial-gray-streams lisp_usocket  ];
      inherit stdenv;
      systemName = "snmp";
      
      sourceProject = "${lisp-project_snmp}";
      patches = [];
      lisp_dependencies = "${lisp_ieee-floats} ${lisp_ironclad} ${lisp_portable-threads} ${lisp_trivial-gray-streams} ${lisp_usocket}";
      name = "lisp_snmp-6.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
