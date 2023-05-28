<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}

        <link rel="/resources/fvkpi/login/custom/register.css" type="text/css" href="styles.css">
    <#elseif section = "form">
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                // 폼 제출 이벤트 핸들러
                document.getElementById("kc-register-form").addEventListener("submit", function(event) {
                    // 폼의 기본 동작(페이지 새로고침)을 막음
                    event.preventDefault();

                    // 폼 데이터를 JSON 형식으로 변환
                    var formData = {
                        email: document.querySelector("input[name='email']").value
                    };

                    // 서버로 데이터 전송
                    fetch("http://localhost:80/user/join", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(formData)
                    })
                        .then(response => response.json())
                        .then(data => {
                            console.log(data);
                        })
                        .catch(error => {
                            console.log(error);
                        });
                });
            });
        </script>

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                // 입력 필드의 값이 변경될 때 라벨의 가시성을 설정하는 함수
                function toggleLabelVisibility(inputId) {
                    var inputField = document.getElementById(inputId);
                    var label = document.getElementById(inputId + "Label");

                    if (inputField.value !== "") {
                        label.style.display = "none"; // 값이 있을 때 라벨을 숨김
                    } else {
                        label.style.display = "block"; // 값이 없을 때 라벨을 보임
                    }
                }

                // 모든 입력 필드에 대한 이벤트 리스너를 추가
                var inputFields = document.querySelectorAll("input");
                inputFields.forEach(function(inputField) {
                    inputField.addEventListener("input", function() {
                        toggleLabelVisibility(inputField.id);
                    });

                    // 초기 라벨의 가시성 설정
                    toggleLabelVisibility(inputField.id);
                });
            });
        </script>
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="http://localhost:80/user/join" method="post">

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">

                <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon" role="button"></i>
                    <input tabindex="0" required id="email" class="mdc-text-field__input ${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" type="email" autofocus autocomplete="off">
                    <div class="mdc-line-ripple"></div>
                    <label id="emailLabel" for="email" class="mdc-floating-label ${properties.kcLabelClass!}">
                        ${msg("email")}
                    </label>
                </div>

            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">

                    <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                        <i class="material-icons mdc-text-field__icon" role="button"></i>
                        <input tabindex="0" required id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" type="text" autofocus autocomplete="off">
                        <div class="mdc-line-ripple"></div>
                        <label id="usernameLabel" for="username" class="mdc-floating-label ${properties.kcLabelClass!}">
                            ${msg("username")}
                        </label>
                    </div>

                </div>
            </#if>

            <#if passwordRequired??>
                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">

                    <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                        <i class="material-icons mdc-text-field__icon" role="button"></i>
                        <input tabindex="0" required id="password" class="mdc-text-field__input ${properties.kcInputClass!}" name="password" type="password" autocomplete="off">
                        <div class="mdc-line-ripple"></div>
                        <label id="passwordLabel" for="password" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>

                </div>

                <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">

                    <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                        <i class="material-icons mdc-text-field__icon" role="button"></i>
                        <input tabindex="0" required id="password-confirm" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-confirm" type="password" autocomplete="off">
                        <div class="mdc-line-ripple"></div>
                        <label id="password-confirmLabel" for="password-confirm" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                    </div>

                </div>
            </#if>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('nickname',properties.kcFormGroupErrorClass!)}">

                <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon" role="button"></i>
                    <input tabindex="0" required id="nickname" class="mdc-text-field__input ${properties.kcInputClass!}" name="nickname" value="${(register.formData.nickname!'')}" type="text" autofocus autocomplete="off">
                    <div class="mdc-line-ripple"></div>
                    <label id="nicknameLabel" for="nickname" class="mdc-floating-label ${properties.kcLabelClass!}">
                        ${msg("nickname")}
                    </label>
                </div>

            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('phoneNumber',properties.kcFormGroupErrorClass!)}">

                <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon" role="button"></i>
                    <input tabindex="0" required id="phoneNumber" class="mdc-text-field__input ${properties.kcInputClass!}" name="phoneNumber" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${(register.formData.phoneNumber!'')}" type="text" autofocus autocomplete="off">
                    <div class="mdc-line-ripple"></div>
                    <label id="phoneNumberLabel" for="phoneNumber" class="mdc-floating-label ${properties.kcLabelClass!}">
                        ${msg("phoneNumber")}
                    </label>
                </div>

            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('address',properties.kcFormGroupErrorClass!)}">

                 <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                     <i class="material-icons mdc-text-field__icon" role="button"></i>
                     <input tabindex="0" required id="phoneNumber" class="mdc-text-field__input ${properties.kcInputClass!}" name="address" value="${(register.formData.address!'')}" type="text" autofocus autocomplete="off">
                     <div class="mdc-line-ripple"></div>
                     <label id="phoneNumberLabel" for="address" class="mdc-floating-label ${properties.kcLabelClass!}">
                         ${msg("address")}
                     </label>
                 </div>

            </div>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('gender',properties.kcFormGroupErrorClass!)}">

                <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon" role="button"></i>
                    <select tabindex="0" required id="gender" class="mdc-select ${properties.kcInputClass!}" name="gender">
                        <option value="" <#if (register.formData.gender!'') == ''>selected</#if>></option>
                        <option value="male" <#if (register.formData.gender!'') == 'male'>selected</#if>>Male</option>
                        <option value="female" <#if (register.formData.gender!'') == 'female'>selected</#if>>Female</option>
                    </select>
                    <div class="mdc-line-ripple"></div>
                    <label id="genderLabel" for="gender" class="mdc-floating-label ${properties.kcLabelClass!}">
                        ${msg("gender")}
                    </label>
                </div>

            </div>

            <style>
                #gender{
                    border: none;
                    outline: none;
                    background-color: #f8f7f7;
                    width: 100%;
                }
            </style>

            <script>
                // select 요소 가져오기
                var selectElement = document.getElementById('gender');
                // label 요소 가져오기
                var labelElement = document.getElementById('genderLabel');

                // select 값 변경 시 이벤트 처리
                selectElement.addEventListener('change', function() {
                    // select 값이 있으면 label 숨기기
                    if (selectElement.value !== '') {
                        labelElement.style.display = 'none';
                    } else {
                        labelElement.style.display = 'block';
                    }
                });
            </script>

            <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('birth',properties.kcFormGroupErrorClass!)}">

                <div class="mdc-text-field mdc-text-field--with-leading-icon ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon" role="button"></i>
                    <input tabindex="0" required id="birth" class="mdc-text-field__input ${properties.kcInputClass!}" name="birth" value="${(register.formData.birth!'')}" type="date" autofocus autocomplete="off">
                    <div class="mdc-line-ripple"></div>
<#--                    <label id="birthLabel" for="birth" class="mdc-floating-label ${properties.kcLabelClass!}">-->
<#--                        ${msg("birth")}-->
<#--                    </label>-->
                </div>

            </div>


            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="mdc-card__actions">

                <a href="${url.loginUrl}" class="mdc-button mdc-card__action mdc-card__action--button">
<#--                    <i class="material-icons mdc-button__icon"></i>-->
                    ${kcSanitize(msg("backToLogin"))?no_esc}
                </a>

                <div class="mdc-card__action-icons">
                    <div class="mdc-card__action-buttons">
                        <button tabindex="0" name="login" id="kc-login" type="submit" class="mdc-button mdc-button--raised mdc-card__action">
                            ${msg("doRegister")}
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
