
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_prove-asdf, lisp_clack-handler-hunchentoot, lisp_clack, lisp_clack-test,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_clack-handler-hunchentoot lisp_clack lisp_clack-test  ];
      inherit stdenv;
      systemName = "t-clack-handler-hunchentoot";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_clack-handler-hunchentoot} ${lisp_clack} ${lisp_clack-test}";
      name = "lisp_t-clack-handler-hunchentoot-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
