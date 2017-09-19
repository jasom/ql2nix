
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-scribd, 
   lisp_ironclad, lisp_cxml, lisp_drakma,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ironclad lisp_cxml lisp_drakma  ];
      inherit stdenv;
      systemName = "cl-scribd";
      
      sourceProject = "${lisp-project_cl-scribd}";
      patches = [];
      lisp_dependencies = "${lisp_ironclad} ${lisp_cxml} ${lisp_drakma}";
      name = "lisp_cl-scribd-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
