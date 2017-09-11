
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-clon, 
   lisp_net-didierverna-clon-setup,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_net-didierverna-clon-setup  ];
      inherit stdenv;
      systemName = "net.didierverna.clon.core";
      
      sourceProject = "${lisp-project_cl-clon}";
      patches = [];
      lisp_dependencies = "${lisp_net-didierverna-clon-setup}";
      name = "lisp_net-didierverna-clon-core0b24";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
