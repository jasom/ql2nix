
{ buildLispPackage, stdenv, fetchurl, lisp-project_snark, 
   lisp_snark-agenda, lisp_snark-auxiliary-packages, lisp_snark-deque, lisp_snark-dpll, lisp_snark-feature, lisp_snark-infix-reader, lisp_snark-lisp, lisp_snark-numbering, lisp_snark-pkg, lisp_snark-sparse-array,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_snark-agenda lisp_snark-auxiliary-packages lisp_snark-deque lisp_snark-dpll lisp_snark-feature lisp_snark-infix-reader lisp_snark-lisp lisp_snark-numbering lisp_snark-pkg lisp_snark-sparse-array  ];
      inherit stdenv;
      systemName = "snark-implementation";
      
      sourceProject = "${lisp-project_snark}";
      patches = [];
      lisp_dependencies = "${lisp_snark-agenda} ${lisp_snark-auxiliary-packages} ${lisp_snark-deque} ${lisp_snark-dpll} ${lisp_snark-feature} ${lisp_snark-infix-reader} ${lisp_snark-lisp} ${lisp_snark-numbering} ${lisp_snark-pkg} ${lisp_snark-sparse-array}";
      name = "lisp_snark-implementation-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
