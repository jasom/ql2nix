
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-flv, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "net.didierverna.asdf-flv";
      
      sourceProject = "${lisp-project_asdf-flv}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_net-didierverna-asdf-flv-version-2.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
