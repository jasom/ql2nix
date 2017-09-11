
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_cl-ana-list-utils, lisp_cl-ana-symbol-utils, lisp_cl-ana-tensor, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ana-list-utils lisp_cl-ana-symbol-utils lisp_cl-ana-tensor lisp_closer-mop  ];
      inherit stdenv;
      systemName = "cl-ana.clos-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ana-list-utils} ${lisp_cl-ana-symbol-utils} ${lisp_cl-ana-tensor} ${lisp_closer-mop}";
      name = "lisp_cl-ana-clos-utils-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
