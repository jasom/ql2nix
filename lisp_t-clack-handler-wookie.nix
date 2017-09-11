
{ buildLispPackage, stdenv, fetchurl, lisp-project_clack, 
   lisp_prove-asdf, lisp_clack, lisp_clack-test,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_clack lisp_clack-test  ];
      inherit stdenv;
      systemName = "t-clack-handler-wookie";
      
      sourceProject = "${lisp-project_clack}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_clack} ${lisp_clack-test}";
      name = "lisp_t-clack-handler-wookie-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
