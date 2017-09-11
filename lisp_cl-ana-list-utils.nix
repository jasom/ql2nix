
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_alexandria, lisp_cl-ana-functional-utils, lisp_cl-ana-string-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ana-functional-utils lisp_cl-ana-string-utils  ];
      inherit stdenv;
      systemName = "cl-ana.list-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ana-functional-utils} ${lisp_cl-ana-string-utils}";
      name = "lisp_cl-ana-list-utils-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
