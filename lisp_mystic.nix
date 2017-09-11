
{ buildLispPackage, stdenv, fetchurl, lisp-project_mystic, 
   lisp_anaphora, lisp_cl-mustache, lisp_local-time, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-mustache lisp_local-time lisp_split-sequence  ];
      inherit stdenv;
      systemName = "mystic";
      
      sourceProject = "${lisp-project_mystic}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-mustache} ${lisp_local-time} ${lisp_split-sequence}";
      name = "lisp_mystic-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
