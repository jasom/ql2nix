
{ buildLispPackage, stdenv, fetchurl, lisp-project_north, 
   lisp_uuid, lisp_crypto-shortcuts, lisp_cl-ppcre, lisp_drakma, lisp_documentation-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_uuid lisp_crypto-shortcuts lisp_cl-ppcre lisp_drakma lisp_documentation-utils  ];
      inherit stdenv;
      systemName = "north";
      
      sourceProject = "${lisp-project_north}";
      patches = [];
      lisp_dependencies = "${lisp_uuid} ${lisp_crypto-shortcuts} ${lisp_cl-ppcre} ${lisp_drakma} ${lisp_documentation-utils}";
      name = "lisp_north-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
