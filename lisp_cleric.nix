
{ buildLispPackage, stdenv, fetchurl, lisp-project_cleric, 
   lisp_md5, lisp_erlang-term, lisp_epmd,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_md5 lisp_erlang-term lisp_epmd  ];
      inherit stdenv;
      systemName = "cleric";
      
      sourceProject = "${lisp-project_cleric}";
      patches = [];
      lisp_dependencies = "${lisp_md5} ${lisp_erlang-term} ${lisp_epmd}";
      name = "lisp_cleric-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
