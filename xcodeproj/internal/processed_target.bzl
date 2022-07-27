"""Functions for creating data structures related to processed bazel targets."""

load(":providers.bzl", "target_type")

def processed_target(
        *,
        automatic_target_info,
        compilation_providers,
        dependencies,
        extension_infoplists = None,
        hosted_targets = None,
        inputs,
        library = None,
        non_mergable_targets = None,
        outputs,
        potential_target_merges = None,
        resource_bundle_informations = None,
        search_paths,
        transitive_dependencies,
        xcode_target):
    """Generates the return value for target processing functions.

    Args:
        automatic_target_info: The `XcodeProjAutomaticTargetProcessingInfo` for
            the target.
        compilation_providers: A value returned from
            `compilation_providers.collect`.
        dependencies: A `depset` of target ids of direct dependencies of this
            target.
        extension_infoplists: A `list` of `File` for the Info.plist's of an
            application extension target, or `None`.
        hosted_targets: An optional `list` of `struct`s as used in
            `XcodeProjInfo.hosted_targets`.
        inputs: A value as returned from `input_files.collect` that will
            provide values for the `XcodeProjInfo.inputs` field.
        library: A `File` for the static library produced by this target, or
            `None`.
        non_mergable_targets: An optional `list` of strings that will be in the
            `XcodeProjInfo.non_mergable_targets` `depset`.
        outputs: A value as returned from `output_files.collect` that will
            provide values for the `XcodeProjInfo.outputs` field.
        potential_target_merges: An optional `list` of `struct`s that will be in
            the `XcodeProjInfo.potential_target_merges` `depset`.
        resource_bundle_informations: An optional `list` of `struct`s that will
            be in the `XcodeProjInfo.resource_bundle_informations` `depset`.
        search_paths: A value as returned from `target_search_paths.make`.
        transitive_dependencies: A `depset` of target ids of transitive
            dependencies of this target.
        xcode_target: An optional value returned from `xcode_targets.make` that
            will be in the `XcodeProjInfo.xcode_targets` `depset`.

    Returns:
        A `struct` containing fields for each argument.
    """
    return struct(
        automatic_target_info = automatic_target_info,
        compilation_providers = compilation_providers,
        extension_infoplists = extension_infoplists,
        dependencies = dependencies,
        hosted_targets = hosted_targets,
        inputs = inputs,
        library = library,
        non_mergable_targets = non_mergable_targets,
        outputs = outputs,
        potential_target_merges = potential_target_merges,
        resource_bundle_informations = resource_bundle_informations,
        search_paths = search_paths,
        target_type = target_type,
        transitive_dependencies = transitive_dependencies,
        xcode_target = xcode_target,
        xcode_targets = [xcode_target] if xcode_target else None,
    )
