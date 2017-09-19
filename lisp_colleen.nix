
{ buildLispPackage, stdenv, fetchurl, lisp-project_colleen, 
   lisp_trivial-arguments, lisp_uuid, lisp_flexi-streams, lisp_usocket, lisp_verbose, lisp_universal-config, lisp_bordeaux-threads,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-arguments lisp_uuid lisp_flexi-streams lisp_usocket lisp_verbose lisp_universal-config lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "colleen";
      
      sourceProject = "${lisp-project_colleen}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-arguments} ${lisp_uuid} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_verbose} ${lisp_universal-config} ${lisp_bordeaux-threads}";
      name = "lisp_colleen-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
