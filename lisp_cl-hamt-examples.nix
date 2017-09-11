
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hamt, 
   lisp_cl-hamt, lisp_cl-ppcre, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-hamt lisp_cl-ppcre lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-hamt-examples";
      
      sourceProject = "${lisp-project_cl-hamt}";
      patches = [];
      lisp_dependencies = "${lisp_cl-hamt} ${lisp_cl-ppcre} ${lisp_drakma}";
      name = "lisp_cl-hamt-examples-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
