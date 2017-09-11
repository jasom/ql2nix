
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ana, 
   lisp_alexandria, lisp_cl-ana-list-utils, lisp_cl-ana-string-utils, lisp_cl-ana-symbol-utils, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-ana-list-utils lisp_cl-ana-string-utils lisp_cl-ana-symbol-utils lisp_split-sequence  ];
      inherit stdenv;
      systemName = "cl-ana.macro-utils";
      
      sourceProject = "${lisp-project_cl-ana}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-ana-list-utils} ${lisp_cl-ana-string-utils} ${lisp_cl-ana-symbol-utils} ${lisp_split-sequence}";
      name = "lisp_cl-ana-macro-utils-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }