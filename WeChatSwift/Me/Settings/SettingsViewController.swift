//
//  SettingsViewController.swift
//  WeChatSwift
//
//  Created by xushuifeng on 2019/7/21.
//  Copyright © 2019 alexiscn. All rights reserved.
//

import AsyncDisplayKit

class SettingsViewController: ASViewController<ASTableNode> {
    
    private var dataSource: [SettingsTableGroupModel] = []
    
    init() {
        super.init(node: ASTableNode(style: .grouped))
        node.dataSource = self
        node.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        node.backgroundColor = Colors.DEFAULT_BACKGROUND_COLOR
        setupDataSource()
        node.reloadData()
    }
    
    private func setupDataSource() {
        let accountModel = SettingsTableModel(type: .accountAndSecurity, title: "账号与安全")
        dataSource.append(SettingsTableGroupModel(models: [accountModel]))
        
        let messageModel = SettingsTableModel(type: .newMessageNotification, title: "新消息通知")
        let privacyModel = SettingsTableModel(type: .privacy, title: "隐私")
        let generalModel = SettingsTableModel(type: .general, title: "通用")
        dataSource.append(SettingsTableGroupModel(models: [messageModel, privacyModel, generalModel]))
        
        let helpModel = SettingsTableModel(type: .helpAndFeedback, title: "帮助与反馈")
        let aboutModel = SettingsTableModel(type: .about, title: "关于微信")
        dataSource.append(SettingsTableGroupModel(models: [helpModel, aboutModel]))
        
        let pluginModel = SettingsTableModel(type: .plugins, title: "插件")
        dataSource.append(SettingsTableGroupModel(models: [pluginModel]))
        
        let switchAccountModel = SettingsTableModel(type: .switchAccount, title: "切换账号")
        dataSource.append(SettingsTableGroupModel(models: [switchAccountModel]))
        
        let logoutModel = SettingsTableModel(type: .logout, title: "退出登录")
        dataSource.append(SettingsTableGroupModel(models: [logoutModel]))
    }
}

// MARK: - ASTableDelegate & ASTableDataSource
extension SettingsViewController: ASTableDelegate, ASTableDataSource {
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return dataSource.count
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].models.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        let model = dataSource[indexPath.section].models[indexPath.row]
        let block: ASCellNodeBlock = {
            return SettingsCellNode(model: model)
        }
        return block
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8.0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
    }
}