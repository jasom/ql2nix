
{ buildLispPackage, stdenv, fetchurl, lisp-project_lparallel, 
   lisp_lparallel, lisp_trivial-garbage,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lparallel lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "lparallel-bench";
      
      sourceProject = "${lisp-project_lparallel}";
      patches = [];
      lisp_dependencies = "${lisp_lparallel} ${lisp_trivial-garbage}";
      name = "lisp_lparallel-bench-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
