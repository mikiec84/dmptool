import * as notifier from '../../utils/notificationHelper';
import ariatiseForm from '../../utils/ariatiseForm';
import { isObject, isString } from '../../utils/isType';

$(() => {
  // Invite Collaborators form on the Share page
  ariatiseForm({ selector: '#new_role' });

  const request = (el) => {
    const form = $(el).closest('form');
    return $.ajax({
      method: $(form).attr('method'),
      url: $(form).attr('action'),
      data: $(form).serializeArray(),
      dataType: 'json',
    });
  };

  $('#set_visibility [name="plan[visibility]"]').click((e) => {
    request(e.target).then((data) => {
      if (isObject(data) && isString(data.msg)) {
        notifier.renderNotice(data.msg);
      }
    }, (jqXHR, textStatus) => {
      if (isObject(jqXHR.responseJSON)) {
        notifier.renderAlert(jqXHR.responseJSON.msg);
      } else {
        notifier.renderAlert(textStatus);
      }
    });
  });
});