Return-Path: <qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAF9CA9EBB
	for <qemu-rust@archiver.kernel.org>; Mon, 12 Oct 2026 03:54:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1xG76m-000728-F6; Sun, 11 Oct 2026 23:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asdfkwang@gmail.com>)
 id 1xG4bU-00008G-DE
 for qemu-rust@nongnu.org; Sun, 11 Oct 2026 21:13:24 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <asdfkwang@gmail.com>)
 id 1xG4bS-0008Kq-Qa
 for qemu-rust@nongnu.org; Sun, 11 Oct 2026 21:13:24 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-3a4c47bb6e3so589747a91.1
 for <qemu-rust@nongnu.org>; Sun, 11 Oct 2026 18:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791767601; x=1792372401; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=CyBAi07xKL3F76J4hKkaiJ9rZDEK3TAuDFlzJIZ6eW0=;
 b=sARYvTcqCMJdXHZIduLNY5JRLjmmQL7s61IMr2wag8jDu5Lmgb5rKKu0clqqZjhd2M
 6MS3TL6hMowglRHTSx1/BadlHMDB3igvMJIW9jzPm5AwSSQ8Kh9kJiZuRdWaQK9nSyVj
 mzjYzjh7UxXEBQYbF7Ykw67nR0TZtwDWkJbswXcN+5hv3221rOobnIotsKhYxJemv0XQ
 OWxBPvgGhfURJ5ad/dUR05Fc6wyladOGGxBXoP6Fvymq1KSnszPk9rYzseQGO4pYJIvC
 D/rSTVZZbAnLXwfvVTxQpIoWvPKWVZxn9u+gHmijwHh8OZgqrERbmhE6yGs7HYc3zfTs
 O+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791767601; x=1792372401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CyBAi07xKL3F76J4hKkaiJ9rZDEK3TAuDFlzJIZ6eW0=;
 b=MWDDb3a9f0wvL2cRrEmsmahr+GCQxymR4aEDmXoK2Z6MPv0f6Bg7Xvuc1b3s/0o36A
 E4sI1FCLPE3Pz8eBA8saqWhJr85Jxf5dwVfggSWdj6XC1RwBSFo+PT0nyCEPA5m+u/5/
 cozfbt/aMvpAY/EQ7zYEJPgSHRTz5bmUhZLHDT2AUBPtY/X1iohhw1/MiPL1jLTF5Jyt
 DElHs0Uwbg7X+wrc03L7nVoXLSqzICMO+vKACk8KxskM/6isJsFsSM8PNjjnz/ObzsWd
 7bYD/VghZ08i+xoQCACxkOO6dj5pBAFH6LUdCiMQ5q1gvB5uPGoFWs0ERXqykJQRCSW8
 Ih4w==
X-Gm-Message-State: AFq9FYLQljm4jTHaMhxc8/inxFFw1Ov7ZmLzBx9f7XMU4khC8McqSz+o
 PpQmKNbTMUJBJxnO4WuTgsXYmTKP/PbTEao1EFHJ0jy18zhu+DKv7NXbEYJETole28iV+Yw5
X-Gm-Gg: AYBFou1ebBVU1WhSCWswgFbXKpWjA+XCWq7csqxhG9iToZyMqZXW+eE/w1j3KiofukK
 bmTx7M1ankYpBkTCnbCd6y6qEmHxkH8AvzBTdtOejoQVidY3RyDPpBWWdjj9QgAgque1ZkTDPuq
 ywL7kk/j9AQlwQG7DDxF5dWSJsmvQWzZFRhhP1HSCn1VINwPWQTg5snyTtN41NVWxOIIT1frKVL
 k9EVCio5iYrisKSMBgis6q6xH8LpHZvYkQO2UB+zb1NOLwcIiHkCBPZrrPPMcGbG1DFtVLWYUpZ
 jGATOLCtwktBg9ef22HW8ciTXuwXmjFW/TtqjF9wNY5BVbJ1FftOydjNRuuNoABs/VRdW7NNaGS
 PUrsW95TCjRB+9+hruASi47mLb4E/3gfxvSupJXuCq+QwiKe+SWeUsp3FNUe4GQmfeR4ciJr05I
 6kzgpL+yq8hUkx7dNHKYJ9IB5zT+l5BxEUIBL2GXuGxjeAr4mNzeyytDhSKk5cchZ/aKAwUSVxT
 KGb2AE5lr8=
X-Received: by 2002:a17:90b:384c:b0:3a7:aa1c:476b with SMTP id
 98e67ed59e1d1-3ab3a747d90mr7878195a91.31.1791767600514; 
 Sun, 11 Oct 2026 18:13:20 -0700 (PDT)
Received: from localhost.localdomain ([169.211.140.146])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3abdd5d09aesm3785362a91.7.2026.10.11.18.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 18:13:19 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
To: qemu-rust@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: [QEMU Rust] Looking for beginner-friendly contribution opportunities
Date: Sun, 11 Oct 2026 21:12:25 -0400
Message-ID: <20261012011235.2947-1-asdfkwang@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=asdfkwang@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Oct 2026 23:53:50 -0400
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org
Sender: qemu-rust-bounces+qemu-rust=archiver.kernel.org@nongnu.org

I'm interested in contributing to QEMU's Rust development.

I have experience with Linux kernel development, embedded systems,
and Rust, and I'd like to get more involved in QEMU.

I've read the QEMU Rust development guide [1], and I'm wondering
if there are any beginner-friendly contribution opportunities or
a TODO list that I could start with.

Any suggestions would be greatly appreciated!

Thanks,
Kwang

[1] https://www.qemu.org/docs/master/devel/rust.html#writing-rust-code-in-qemu

