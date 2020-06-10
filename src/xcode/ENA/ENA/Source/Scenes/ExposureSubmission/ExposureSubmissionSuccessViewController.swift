// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import Foundation
import UIKit

final class ExposureSubmissionSuccessViewController: DynamicTableViewController {
	// MARK: UIViewController

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTitle()
		setUpView()
		setButtonTitle(to: AppStrings.ExposureSubmissionSuccess.button)
	}

	private func setUpView() {
		navigationItem.hidesBackButton = true
		tableView.register(DynamicTableViewStepCell.self, forCellReuseIdentifier: CustomCellReuseIdentifiers.stepCell.rawValue)
		dynamicTableViewModel = .data
	}

	private func setupTitle() {
		title = AppStrings.ExposureSubmissionSuccess.title
		navigationItem.largeTitleDisplayMode = .always
		navigationController?.navigationBar.prefersLargeTitles = true
	}

	func didTapButton() {
		dismiss(animated: true, completion: nil)
	}
}

extension ExposureSubmissionSuccessViewController: ExposureSubmissionNavigationControllerChild {}

private extension DynamicTableViewModel {
	static let data = DynamicTableViewModel([
		DynamicSection.section(
			header: .image(
				UIImage(named: "Illu_Submission_VielenDank"),
				accessibilityLabel: AppStrings.ExposureSubmissionSuccess.accImageDescription,
				accessibilityIdentifier: "AppStrings.ExposureSubmissionSuccess.accImageDescription"
			),
			separators: false,
			cells: [
				.body(text: AppStrings.ExposureSubmissionSuccess.description,
					  accessibilityIdentifier: "AppStrings.ExposureSubmissionSuccess.description"),
				.title2(text: AppStrings.ExposureSubmissionSuccess.listTitle,
						accessibilityIdentifier: "AppStrings.ExposureSubmissionSuccess.listTitle"),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configure(
							text: AppStrings.ExposureSubmissionSuccess.listItem1,
							image: UIImage(named: "Icons - Hotline"),
							hasSeparators: false,
							isCircle: true,
							iconTintColor: .enaColor(for: .riskHigh),
							iconCentered: true
						)
					}
				),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configure(
							text: AppStrings.ExposureSubmissionSuccess.listItem2,
							image: UIImage(named: "Icons - Home"),
							isCircle: true,
							iconTintColor: .enaColor(for: .riskHigh),
							iconCentered: true
						)
					}
				),
				.title2(text: AppStrings.ExposureSubmissionSuccess.subTitle,
						accessibilityIdentifier: "AppStrings.ExposureSubmissionSuccess.subTitle"),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configureBulletPointCell(text: AppStrings.ExposureSubmissionSuccess.listItem2_1)
				}
				),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configureBulletPointCell(text: AppStrings.ExposureSubmissionSuccess.listItem2_2)
				}
				),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configureBulletPointCell(text: AppStrings.ExposureSubmissionSuccess.listItem2_3)
				}
				),
				.identifier(
					ExposureSubmissionSuccessViewController.CustomCellReuseIdentifiers.stepCell,
					action: .none,
					configure: { _, cell, _ in
						guard let cell = cell as? DynamicTableViewStepCell else { return }
						cell.configureBulletPointCell(text: AppStrings.ExposureSubmissionSuccess.listItem2_4)
				}
				)
			]
		)
	])
}

// MARK: - Cell reuse identifiers.

extension ExposureSubmissionSuccessViewController {
	enum CustomCellReuseIdentifiers: String, TableViewCellReuseIdentifiers {
		case stepCell
	}
}
