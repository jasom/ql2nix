
{ buildLispPackage, stdenv, fetchurl, lisp-project_configuration-options, 
   lisp_esrap, lisp_log4cl, lisp_architecture-service-provider, lisp_cl-hooks, lisp_utilities-print-tree, lisp_utilities-print-items, lisp_more-conditions, lisp_let-plus, lisp_split-sequence, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_esrap lisp_log4cl lisp_architecture-service-provider lisp_cl-hooks lisp_utilities-print-tree lisp_utilities-print-items lisp_more-conditions lisp_let-plus lisp_split-sequence lisp_alexandria  ];
      inherit stdenv;
      systemName = "configuration.options";
      
      sourceProject = "${lisp-project_configuration-options}";
      patches = [];
      lisp_dependencies = "${lisp_esrap} ${lisp_log4cl} ${lisp_architecture-service-provider} ${lisp_cl-hooks} ${lisp_utilities-print-tree} ${lisp_utilities-print-items} ${lisp_more-conditions} ${lisp_let-plus} ${lisp_split-sequence} ${lisp_alexandria}";
      name = "lisp_configuration-options-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
