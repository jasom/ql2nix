
{ buildLispPackage, stdenv, fetchurl, lisp-project_rfc2388-binary, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "rfc2388-binary";
      
      sourceProject = "${lisp-project_rfc2388-binary}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_rfc2388-binary-20170124-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
