
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-rcfiles, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "com.dvlsoft.rcfiles";
      
      sourceProject = "${lisp-project_cl-rcfiles}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_com-dvlsoft-rcfiles-20111203-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
