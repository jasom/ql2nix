
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamt, 
   lisp_drakma, lisp_cl-ppcre, lisp_cl-murmurhash,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_cl-ppcre lisp_cl-murmurhash  ];
      inherit stdenv;
      systemName = "cl-hamt-examples";
      
      sourceProject = "${lisp-project_cl-hamt}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_cl-ppcre} ${lisp_cl-murmurhash}";
      name = "lisp_cl-hamt-examples-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
