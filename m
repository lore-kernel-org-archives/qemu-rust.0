Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1trDtn-0006jr-6H
	for mharc-qemu-rust@gnu.org; Sun, 09 Mar 2025 06:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1trDtm-0006gl-1d
 for qemu-rust@nongnu.org; Sun, 09 Mar 2025 06:28:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1trDtk-0002rm-Ar
 for qemu-rust@nongnu.org; Sun, 09 Mar 2025 06:28:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741516118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y3/T5P2oAUF10DYW7ZiBW/R86qLT70rCJsxPBXNqRHM=;
 b=P4LxXLV80YubH7OYqN05NDG6DLyGnfZdsZrN4/dVd5kBX58BHO1AkNR4nyhZYzEpFuqF8w
 NYSNdQpxKkOWkNfhw1NFn9uYHMVjmiABcMysGd/Z+gRXRzgbI5m0IjwGZZH0M89LU2/npY
 oKo7p+gMUhqFskbsiO/NrpX/U5vjvT4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-cChVGAn8PoeKiS58PqcgBA-1; Sun, 09 Mar 2025 06:28:36 -0400
X-MC-Unique: cChVGAn8PoeKiS58PqcgBA-1
X-Mimecast-MFC-AGG-ID: cChVGAn8PoeKiS58PqcgBA_1741516115
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43935e09897so21918365e9.1
 for <qemu-rust@nongnu.org>; Sun, 09 Mar 2025 03:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741516115; x=1742120915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y3/T5P2oAUF10DYW7ZiBW/R86qLT70rCJsxPBXNqRHM=;
 b=TG8vWwRocRCfsvtvrc98+UP3fZzjzGCIqKrhLGMH+tyh2SER/fE6it6YJ/ZL1z4Z3o
 57OVtdv0W8/sVPJ3Yss6hMTZ4kcILkVhHiPNMr6Hts8y9vHzpUhJ51uYw92vSfy/8oMm
 DLk++VjoaFIOGaWvNgxrPC+jY9gdZF+/OjynnWx87J3LzBRTZ1KQxrxV9sJ0LKotRN6w
 38d5DfMpZ+LYn2Kn2xScBnH9xQXlMmFLTQyySPgMICnNDwRJTBCAY4U+S+fGpm56hrlm
 9XZxdTHHx2bVde8X639oeqR3FKY72G+qUcpw6+ZHHdygyVrLZr0ihQ9wyZkl/MmTE4vo
 2dBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ua2Niigt0/eujhBPB1hTWiPJ/f1hEce46/j3cNW0uBntmIG1mW/uxt9jVevsvrieyc6PbFe4NCg=@nongnu.org
X-Gm-Message-State: AOJu0Yyq4Kz4bETu6DE81YCXoddGpt2PnZroavNGp6r3BolcFnLgPYC+
 zwUa/igLj3J0vQpQifjNMEtL0Ee+NTQZhafEjnLwcddJtmunimb9dOUm40nKFFPdWjAZ4RdtTt9
 9VnlRzs9Kwjqu5twqiuADwcUIN6/hjtPPH/Lfa6+R/lVxG5Bd7XY=
X-Gm-Gg: ASbGncuuGowUYmt7c3Emif7M2BUR2YvMjb+P3pFjcCwVslAwF17iP+himHR+D0+Ptbt
 Zd1nZZjVRGeWh8QJTXJj+wRzvQ3MJqJGwOsnuurqcOV6E3nvvZtFLLb8bHgPom+EJc8bylzCtvF
 IGZQLfn7MIAewam6AmV7vhgsbjynNb12FMJ9uzkULjALsBLzK95VeR+TZOEskJAnUWWd1D6XmEL
 aFqWPL2QfBpMFtlz7Bjpr5xDj57yVRFx0ingL3bhdn4SFtif8aM+u0NjLlZBYiWatrrN3n+RRWP
 14US0QWfMeoIfz0UMrdmPg==
X-Received: by 2002:a05:600c:3556:b0:43c:ec27:8de1 with SMTP id
 5b1f17b1804b1-43cec278ef4mr23694845e9.10.1741516115327; 
 Sun, 09 Mar 2025 03:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJfQbufps26AdeJodkGGedO21xdIzJbZQEfykTBPLsX+8CK4YzvQjFZedo8tZ4vubcxQY9DA==
X-Received: by 2002:a05:600c:3556:b0:43c:ec27:8de1 with SMTP id
 5b1f17b1804b1-43cec278ef4mr23694725e9.10.1741516115043; 
 Sun, 09 Mar 2025 03:28:35 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.122.167])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8b0461sm114433225e9.4.2025.03.09.03.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 03:28:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
	qemu-rust@nongnu.org
Subject: Re: [PATCH] rust: pl011: Allow NULL chardev argument to pl011_create()
Date: Sun,  9 Mar 2025 11:25:19 +0100
Message-ID: <20250309102518.1115001-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307190051.3274226-1-peter.maydell@linaro.org>
References: 
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NbgT5bRIZ6a0YlvAWNoB858GlsaZRhFLY2_rh6WSfmU_1741516115
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Sun, 09 Mar 2025 10:28:46 -0000

> This is my first Rust related patch for QEMU, so I've
> probably got something wrong here :-)

No no, that was all good!  Applied, thanks.

Paolo


