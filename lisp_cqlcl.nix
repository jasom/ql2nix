
{ buildLispPackage, stdenv, fetchurl, lisp-project_cqlcl, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_fiveam, lisp_flexi-streams, lisp_lparallel, lisp_pooler, lisp_split-sequence, lisp_usocket, lisp_uuid,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_fiveam lisp_flexi-streams lisp_lparallel lisp_pooler lisp_split-sequence lisp_usocket lisp_uuid  ];
      inherit stdenv;
      systemName = "cqlcl";
      
      sourceProject = "${lisp-project_cqlcl}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_fiveam} ${lisp_flexi-streams} ${lisp_lparallel} ${lisp_pooler} ${lisp_split-sequence} ${lisp_usocket} ${lisp_uuid}";
      name = "lisp_cqlcl-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
