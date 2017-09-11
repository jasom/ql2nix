
{ buildLispPackage, stdenv, fetchurl, lisp-project_ip-interfaces, 
   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi  ];
      inherit stdenv;
      systemName = "ip-interfaces";
      
      sourceProject = "${lisp-project_ip-interfaces}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_ip-interfaces-0.2.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
