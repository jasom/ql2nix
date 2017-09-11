
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-creditcard, 
   lisp_alexandria, lisp_cl-creditcard, lisp_drakma, lisp_split-sequence, lisp_symbol-munger,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-creditcard lisp_drakma lisp_split-sequence lisp_symbol-munger  ];
      inherit stdenv;
      systemName = "cl-authorize-net";
      
      sourceProject = "${lisp-project_cl-creditcard}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-creditcard} ${lisp_drakma} ${lisp_split-sequence} ${lisp_symbol-munger}";
      name = "lisp_cl-authorize-net-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
