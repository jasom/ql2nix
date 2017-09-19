
{ buildLispPackage, stdenv, fetchurl, lisp-project_cqlcl, 
   lisp_usocket, lisp_lparallel, lisp_split-sequence, lisp_uuid, lisp_flexi-streams, lisp_pooler, lisp_fiveam,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_usocket lisp_lparallel lisp_split-sequence lisp_uuid lisp_flexi-streams lisp_pooler lisp_fiveam  ];
      inherit stdenv;
      systemName = "cqlcl";
      
      sourceProject = "${lisp-project_cqlcl}";
      patches = [];
      lisp_dependencies = "${lisp_usocket} ${lisp_lparallel} ${lisp_split-sequence} ${lisp_uuid} ${lisp_flexi-streams} ${lisp_pooler} ${lisp_fiveam}";
      name = "lisp_cqlcl-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
