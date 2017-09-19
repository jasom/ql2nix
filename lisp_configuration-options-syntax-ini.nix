
{ buildLispPackage, stdenv, fetchurl, lisp-project_configuration-options, 
   lisp_parser-ini, lisp_esrap, lisp_log4cl, lisp_architecture-service-provider, lisp_cl-hooks, lisp_utilities-print-tree, lisp_utilities-print-items, lisp_more-conditions, lisp_split-sequence, lisp_let-plus, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parser-ini lisp_esrap lisp_log4cl lisp_architecture-service-provider lisp_cl-hooks lisp_utilities-print-tree lisp_utilities-print-items lisp_more-conditions lisp_split-sequence lisp_let-plus lisp_alexandria  ];
      inherit stdenv;
      systemName = "configuration.options-syntax-ini";
      
      sourceProject = "${lisp-project_configuration-options}";
      patches = [];
      lisp_dependencies = "${lisp_parser-ini} ${lisp_esrap} ${lisp_log4cl} ${lisp_architecture-service-provider} ${lisp_cl-hooks} ${lisp_utilities-print-tree} ${lisp_utilities-print-items} ${lisp_more-conditions} ${lisp_split-sequence} ${lisp_let-plus} ${lisp_alexandria}";
      name = "lisp_configuration-options-syntax-ini-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
