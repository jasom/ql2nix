
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-system-connections, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "asdf-system-connections";
      
      sourceProject = "${lisp-project_asdf-system-connections}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_asdf-system-connections-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
