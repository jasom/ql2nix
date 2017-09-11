
{ buildLispPackage, stdenv, fetchurl, lisp-project_dartsclemailaddress, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "darts.lib.email-address";
      
      sourceProject = "${lisp-project_dartsclemailaddress}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_darts-lib-email-address-quicklisp-release-48464635-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
