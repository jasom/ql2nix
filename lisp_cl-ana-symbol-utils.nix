
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_cl-ana-list-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ana-list-utils  ];
      inherit stdenv;
      systemName = "cl-ana.symbol-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ana-list-utils}";
      name = "lisp_cl-ana-symbol-utils-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
