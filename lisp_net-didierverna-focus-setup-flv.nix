
{ buildLispPackage, stdenv, fetchurl, lisp-project_focus, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "net.didierverna.focus.setup/flv";
      
      sourceProject = "${lisp-project_focus}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_net-didierverna-focus-setup-flv-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
