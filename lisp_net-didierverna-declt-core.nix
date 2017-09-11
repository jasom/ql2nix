
{ buildLispPackage, stdenv, fetchurl, lisp-project_declt, 
   lisp_net-didierverna-declt-setup,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_net-didierverna-declt-setup  ];
      inherit stdenv;
      systemName = "net.didierverna.declt.core";
      
      sourceProject = "${lisp-project_declt}";
      patches = [];
      lisp_dependencies = "${lisp_net-didierverna-declt-setup}";
      name = "lisp_net-didierverna-declt-core-2.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
