
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-clon, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "net.didierverna.clon.core";
      
      sourceProject = "${lisp-project_cl-clon}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_net-didierverna-clon-core0b24";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
