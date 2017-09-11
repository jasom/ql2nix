
{ buildLispPackage, stdenv, fetchurl, lisp-project_donuts, 
   lisp_cl-ppcre, lisp_trivial-shell,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "donuts";
      
      sourceProject = "${lisp-project_donuts}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_trivial-shell}";
      name = "lisp_donuts-20120703-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
