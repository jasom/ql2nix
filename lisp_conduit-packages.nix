
{ buildLispPackage, stdenv, fetchurl, lisp-project_conduit-packages, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "conduit-packages";
      
      sourceProject = "${lisp-project_conduit-packages}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_conduit-packages-20140826-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
