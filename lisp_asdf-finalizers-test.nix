
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-finalizers, 
   lisp_asdf-finalizers, lisp_fare-utils, lisp_hu-dwim-stefil, lisp_list-of,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-finalizers lisp_fare-utils lisp_hu-dwim-stefil lisp_list-of  ];
      inherit stdenv;
      systemName = "asdf-finalizers-test";
      
      sourceProject = "${lisp-project_asdf-finalizers}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-finalizers} ${lisp_fare-utils} ${lisp_hu-dwim-stefil} ${lisp_list-of}";
      name = "lisp_asdf-finalizers-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
