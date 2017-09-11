
{ buildLispPackage, stdenv, fetchurl, lisp-project_pseudonyms, 
   lisp_named-readtables, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "pseudonyms";
      
      sourceProject = "${lisp-project_pseudonyms}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables} ${lisp_trivial-garbage}";
      name = "lisp_pseudonyms-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
