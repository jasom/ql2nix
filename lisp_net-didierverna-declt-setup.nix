
{ buildLispPackage, stdenv, fetchurl, lisp-project_declt, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "net.didierverna.declt.setup";
      
      sourceProject = "${lisp-project_declt}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_net-didierverna-declt-setup-2.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
