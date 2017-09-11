
{ buildLispPackage, stdenv, fetchurl, lisp-project_tinaa, 
   lisp_anaphora, lisp_asdf-system-connections, lisp_cl-containers, lisp_cl-graph, lisp_defsystem-compatibility, lisp_dynamic-classes, lisp_lml2, lisp_metatilities, lisp_trivial-shell,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_asdf-system-connections lisp_cl-containers lisp_cl-graph lisp_defsystem-compatibility lisp_dynamic-classes lisp_lml2 lisp_metatilities lisp_trivial-shell  ];
      inherit stdenv;
      systemName = "tinaa";
      
      sourceProject = "${lisp-project_tinaa}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_asdf-system-connections} ${lisp_cl-containers} ${lisp_cl-graph} ${lisp_defsystem-compatibility} ${lisp_dynamic-classes} ${lisp_lml2} ${lisp_metatilities} ${lisp_trivial-shell}";
      name = "lisp_tinaa-20140211-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
